import ctypes
import ctypes.wintypes as wintypes

# Define necessary constants and structures
PROCESS_TERMINATE = 0x0001

# Import functions from user32.dll and kernel32.dll
user32 = ctypes.WinDLL('user32', use_last_error=True)
kernel32 = ctypes.WinDLL('kernel32', use_last_error=True)

# Structure for receiving window text
WNDENUMPROC = ctypes.WINFUNCTYPE(ctypes.c_bool, wintypes.HWND, ctypes.POINTER(ctypes.c_int))

# Find a window with a specific title
def find_window_by_title(title):
    found_hwnd = None

    def enum_windows_proc(hwnd, lParam):
        nonlocal found_hwnd
        length = user32.GetWindowTextLengthW(hwnd)
        buff = ctypes.create_unicode_buffer(length + 1)
        user32.GetWindowTextW(hwnd, buff, length + 1)
        if title in buff.value:
            found_hwnd = hwnd
            return False  # Stop enumeration
        return True  # Continue enumeration

    # Enumerate through all open windows
    user32.EnumWindows(WNDENUMPROC(enum_windows_proc), 0)
    return found_hwnd

# Get process ID from window handle
def get_process_id(hwnd):
    pid = wintypes.DWORD()
    user32.GetWindowThreadProcessId(hwnd, ctypes.byref(pid))
    return pid.value

# Open process and terminate
def terminate_process_by_pid(pid):
    h_process = kernel32.OpenProcess(PROCESS_TERMINATE, False, pid)
    if h_process:
        kernel32.TerminateProcess(h_process, 1)
        kernel32.CloseHandle(h_process)

# Find the window with title 'Top' and close the associated process
hwnd = find_window_by_title("Top")
if hwnd:
    process_id = get_process_id(hwnd)
    terminate_process_by_pid(process_id)
