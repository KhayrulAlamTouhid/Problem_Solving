Answer: Students and Examinations

-- Calculate the number of times each student attended each subject
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(COUNT(e.student_id), 0) AS attended_exams
FROM
    Students s
CROSS JOIN
    Subjects sub
LEFT JOIN
    Examinations e
ON
    s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;

--And we can solved it another way.

-- First, generate a Cartesian product of all students and all subjects
WITH All_Student_Subjects AS (
    SELECT
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM
        Students s
    CROSS JOIN
        Subjects sub
),

-- Then, count the number of times each student attended each subject
Attendance_Count AS (
    SELECT
        e.student_id,
        e.subject_name,
        COUNT(*) AS attended_exams
    FROM
        Examinations e
    GROUP BY
        e.student_id,
        e.subject_name
)

-- Finally, join the two results and handle the cases where there was no attendance
SELECT
    ass.student_id,
    ass.student_name,
    ass.subject_name,
    COALESCE(ac.attended_exams, 0) AS attended_exams
FROM
    All_Student_Subjects ass
LEFT JOIN
    Attendance_Count ac
ON
    ass.student_id = ac.student_id
    AND ass.subject_name = ac.subject_name
ORDER BY
    ass.student_id,
    ass.subject_name;
