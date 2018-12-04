package problem1

import (
	"bufio"
	"io"
	"io/ioutil"
	"strconv"
	"strings"
)

// Calibrator ...
type Calibrator struct {
	state map[int]bool
}

// NewCalibrator ...
func NewCalibrator() Calibrator {
	return Calibrator{
		state: make(map[int]bool),
	}
}

// FindFirstDuplicate ...
func (calibrator *Calibrator) FindFirstDuplicate(frequencies string, currentFrequency int) int {
	scanner := bufio.NewScanner(strings.NewReader(frequencies))
	calibrator.state[currentFrequency] = true
	for scanner.Scan() {
		res, _ := strconv.Atoi(scanner.Text())
		currentFrequency += res
		if _, ok := calibrator.state[currentFrequency]; ok {
			return currentFrequency
		}
		calibrator.state[currentFrequency] = true
	}
	return calibrator.FindFirstDuplicate(frequencies, currentFrequency)
}

// ReadFile ...
func (calibrator *Calibrator) ReadFile(file string) string {
	bytes, _ := ioutil.ReadFile(file)
	return string(bytes)
}

// Calibrate ...
func (calibrator *Calibrator) Calibrate(reader io.Reader) int {
	scanner := bufio.NewScanner(reader)
	resultingFrequency := 0
	for scanner.Scan() {
		res, _ := strconv.Atoi(scanner.Text())
		resultingFrequency += res
	}
	return resultingFrequency
}
