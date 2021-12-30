class Course {
  String? courseName;
  String? courseValue;

  Course(this.courseName, this.courseValue);

  static getCourse() {
    return [
      Course('วิทยาการคอมพิวเตอร์', 'วิทยาการคอมพิวเตอร์'),
      Course('เทคโนโลยีสารสนเทศ', 'เทคโนโลยีสารสนเทศ'),
    ];
  }
}
