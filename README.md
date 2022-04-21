## TERM PROJECT — JPEG Implementation

## CS 443 Spring 2022

## Important Dates:

Due: midnight on 5 / 2 /20 22

## Project Description

The goal of this project is to implement the lossy compression part of the JPEG algorithm.
Implement and apply the following simplified JPEG algorithm for two images in
Project_Code_Images.zip. All of the following techniques are covered by Chapter 8 & 9.

Step I: Compression

1. Convert RGB components to YCbCr components (you can use HW2.).
2. Perform chroma subsampling 4:2:0 on color components (you can use HW 2 ).
3. Apply 2D DCT transform (N = M = 8 ) on Y, Cb, and Cr components (refer to
    **dctbasis.m** in Project_Code_Images.zip)
4. Apply quantization using quantization tables (Table 9.1 and Table 9.2 of the
    Chap9 slide) for Luminance and Chrominance components respectively. (i.e.,
    remove AC components–check Chap. 9 slide.)
5. A Quality Scaling Factor (qf=5, 50,1 00 ) should be applied to the quantization
    table. You must implement the scale factor algorithm from the Chap. 9 lecture
    slide or textbook pg. 284- 285.

Step II: Decompression

1. Dequantize the DCT coefficients.
2. Implement and apply the 2D IDCT to the dequantized DCT coefficients.
3. Convert YCbCr components to RGB model (Use your HW2 or ycbcr2rgb()).

Step III: Outputs

- Save the outputs in .png

Step IV: Error Computation

1. Compute the pixel-wise error (difference) between the original frame and output
    frame and display the error using imagesc() or (any other way you can do with
    your language)
2. Compute the Peak Signal-to-Noise Ratio (I is the original image and _I’_ is the
    output image after Step III).

Step V: Group Report


- Show values of the first 8x8 block of the input and output pictures (only for
    qf=50) for each stage of Step I (from 1 to 5). Importantly, you have to show how
    the values of the 8x8 block are changed according to different stages.
- Include input (two different input pictures from Project_Code_Images.zip) and
    output pictures for each stage at both Step I and II. So, you need to generate your
    intermediate results at each stage.
- Discuss your observations of the results at each stage at Step I and II; discuss
    comparisons between the original image and your final output image.
- Show and discuss how the output images look different based on the qf values.
- Create a table including all error values (Step IV) for two images and four qf
    values. Discuss the results.
- Lastly, your report cover (the first page) should also include a) Names of group
    members and also describe b) responsibilities/ contributions of each group
    members in a separate section.

Submission
You should submit the following materials for the grading. The user should be provided
an option of inputting images to your program. Include everything in a zip file and the
filename of the zip file should include last names of all team members.

- Source code
- The group report
- All output files in png (for each of the two images (pepper and alu), generate six
    output images from the different qf values.)
       output_pepper_qf5.png,
       output_pepper_qf50.png,
       output_pepper_qf100.png
       output_alu_qf5.png,
       output_alu_qf50.png,
       output_alu_qf100.png

Group Project Policy: Typically, all members of a team receive the same project scores,
except for clear occasions. Report any team problems to the instructor early, so
something can be done to remedy the situation before it is too late.

1. You are responsible for choosing group members.
2. Each group must choose a leader. The leader is responsible for the management of
    the group.
3. Each group needs to maintain how many times they met, group members who
    attended the meeting, dates of the meetings, and problems solved. If a group
    member misses a meeting, s/he should let me know as soon as possible if s/he has
    any excuse.
4. All group members should contribute the assignment effectively. Normally, all
    group members will get the same grade for their assignment. However, if there
    are complaints about some members, not all group members get the same grade.


