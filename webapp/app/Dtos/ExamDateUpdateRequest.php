<?php

namespace App\Dtos;

class ExamDateUpdateRequest
{
    private int $examId;
    private string $roomCode;
    private string $lecturerCode;
    private string $courseCode;
    private string $examStartDate;
    private string  $examEndDate;
    private int $maxParticipants;
    private string $note;


    public function __construct(int $examId, string $roomCode, string $lecturerCode,
                                string $courseCode, string $examStartDate, string $examEndDate,
                                int $maxParticipants, string $note)
    {

        $this->examId = $examId;
        $this->roomCode = $roomCode;
        $this->lecturerCode = $lecturerCode;
        $this->courseCode = $courseCode;
        $this->examStartDate = $examStartDate;
        $this->examEndDate = $examEndDate;
        $this->maxParticipants = $maxParticipants;
        $this->note = $note;
    }


    public function getExamId(): int {
        return $this->examId;
    }

    public function setExamId(int $examId): void {
        $this->examId = $examId;
    }

    public function getRoomCode(): string {
        return $this->roomCode;
    }

    public function setRoomCode(string $roomCode): void{
        $this->roomCode = $roomCode;
    }

    public function getLecturerCode(): string {
        return $this->lecturerCode;
    }

    public function setLecturerCode(string $lecturerCode): void {
        $this->lecturerCode = $lecturerCode;
    }

    public function getCourseCode(): string {
        return $this->courseCode;
    }

    public function setCourseCode(string $courseCode): void {
        $this->courseCode = $courseCode;
    }


    public function getExamStartDate(): string {
        return $this->examStartDate;
    }

    public function setExamStartDate(string $examStartDate): void {
        $this->examStartDate = $examStartDate;
    }


    public function getExamEndDate(): string {
        return $this->examEndDate;
    }

    public function setExamEndDate(string $examEndDate): void {
        $this->examEndDate = $examEndDate;
    }


    public function getMaxParticipants(): int {
        return $this->maxParticipants;
    }

    public function setMaxParticipants(int $maxParticipants): void {
        $this->maxParticipants = $maxParticipants;
    }


    public function getNote(): string {
        return $this->note;
    }

    public function setNote(string $note): void {
        $this->note = $note;
    }

}