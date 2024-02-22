#include <cstdlib>    // posix_memalign
#include <sys/mman.h> // madvise, mmap

#include <absl/container/flat_hash_map.h>
#include <nmmintrin.h> // _mm_crc32_u64

#include <stdlib.h>   // posix_memalign
#include <sys/mman.h> // madvise

template <typename T> struct thp_allocator {
  constexpr static std::size_t huge_page_size = 1 << 21; // 2 MiB
  using value_type = T;

  thp_allocator() = default;
  template <class U>
  constexpr thp_allocator(const thp_allocator<U> &) noexcept {}

  T *allocate(std::size_t n) {
    if (n > std::numeric_limits<std::size_t>::max() / sizeof(T)) {
      throw std::bad_alloc();
    }
    void *p = nullptr;
    posix_memalign(&p, huge_page_size, n * sizeof(T));
    madvise(p, n * sizeof(T), MADV_HUGEPAGE);
    if (p == nullptr) {
      throw std::bad_alloc();
    }
    return static_cast<T *>(p);
  }

  void deallocate(T *p, std::size_t n) { std::free(p); }
};
int main(int argc, char *argv[]) {

  struct hash {
    size_t operator()(size_t h) const noexcept { return _mm_crc32_u64(0, h); }
  };

  size_t iters = 10000000;

  absl::flat_hash_map<size_t, size_t, hash, std::equal_to<size_t>> ht;
  // absl::flat_hash_map<size_t, size_t, hash, std::equal_to<size_t>,
  //                     thp_allocator<size_t>>
  //     ht;
  absl::flat_hash_map<size_t, size_t, hash, std::equal_to<size_t>,
                      huge_page_allocator<size_t>>
      ht;

  ht.reserve(iters);

  for (size_t i = 0; i < iters; ++i) {
    ht.try_emplace(i, i);
  }

  return 0;
}
