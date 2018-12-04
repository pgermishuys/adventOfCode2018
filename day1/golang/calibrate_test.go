package problem1

import (
	"strings"
	"testing"
)

func TestWhenFindingFrequencyWithExample(t *testing.T) {
	calibrator := Calibrator{}
	input := `+1
-2
+3
+1`
	frequency := calibrator.Calibrate(strings.NewReader(input))
	if frequency != 3 {
		t.Errorf("Expected %d, but got %d", 3, frequency)
	}
}

func TestWhenFindingFrequencyWithInput(t *testing.T) {
	calibrator := Calibrator{}
	fileContents := calibrator.ReadFile("input.txt")
	frequency := calibrator.Calibrate(strings.NewReader(fileContents))
	if frequency != 459 {
		t.Errorf("Expected %d, but got %d", 459, frequency)
	}
}

func TestWhenFindingFirstDuplicateFrequencyWithExample(t *testing.T) {
	calibrator := NewCalibrator()
	input := `+1
-2
+3
+1`
	duplicateFrequency := calibrator.FindFirstDuplicate(input, 0)
	if duplicateFrequency != 2 {
		t.Errorf("Expected %d, but got %d", 2, duplicateFrequency)
	}
}

func TestWhenFindingFirstDuplicateFrequencyWithInput(t *testing.T) {
	calibrator := NewCalibrator()
	fileContents := calibrator.ReadFile("input.txt")
	duplicateFrequency := calibrator.FindFirstDuplicate(fileContents, 0)
	if duplicateFrequency != 65474 {
		t.Errorf("Expected %d, but got %d", 65474, duplicateFrequency)
	}
}
