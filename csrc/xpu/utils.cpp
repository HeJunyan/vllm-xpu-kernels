#include "utils.h"

using namespace vllm::xpu;

bool is_bmg(int64_t device_index = -1) {
  at::DeviceIndex dev_idx = device_index;
  return vllm::xpu::is_bmg(dev_idx);
}

bool is_pvc(int64_t device_index = -1) {
  at::DeviceIndex dev_idx = device_index;
  return vllm::xpu::is_pvc(dev_idx);
}

bool is_cri(int64_t device_index = -1) {
  at::DeviceIndex dev_idx = device_index;
  return vllm::xpu::is_cri(dev_idx);
}

bool is_nvl_p(int64_t device_index = -1) {
  at::DeviceIndex dev_idx = device_index;
  return vllm::xpu::is_nvl_p(dev_idx);
}

bool is_jgs(int64_t device_index = -1) {
  at::DeviceIndex dev_idx = device_index;
  return vllm::xpu::is_jgs(dev_idx);
}
