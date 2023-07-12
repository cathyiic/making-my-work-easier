//this fr just to make my work easier LOL
#include <iostream>
#include <vector>
#include <algorithm>

std::vector<std::string> compareLists(const std::vector<std::string>& list1, const std::vector<std::string>& list2) {
    std::vector<std::string> commonElements;
    
    for (const std::string& item : list1) {
        if (std::find(list2.begin(), list2.end(), item) != list2.end()) {
            commonElements.push_back(item);
        }
    }
    
    return commonElements;
}

int main() {
    std::vector<std::string> list1, list2;
    std::string item;
    char choice;
    
    std::cout << "Enter items for the first list (separated by spaces): ";
    while (std::cin >> item) {
        list1.push_back(item);
        choice = std::cin.get();
        if (choice == '\n') {
            break;
        }
    }
    
    std::cout << "Enter items for the second list (separated by spaces): ";
    while (std::cin >> item) {
        list2.push_back(item);
        choice = std::cin.get();
        if (choice == '\n') {
            break;
        }
    }
    
    std::vector<std::string> commonElements = compareLists(list1, list2);
    
    std::cout << "Common elements: ";
    for (const std::string& element : commonElements) {
        std::cout << element << " ";
    }
    
    return 0;
}
