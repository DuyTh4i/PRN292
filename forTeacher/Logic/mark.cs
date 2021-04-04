using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace forTeacher.Logic
{
    class mark
    {
        float lab1;
        float lab2;
        float lab3;
        float lab4;
        float pt1;
        float pt2;
        float pe;
        float fe;

        public mark(float lab1, float lab2, float lab3, float lab4, float pt1, float pt2, float pe, float fe)
        {
            this.lab1 = lab1;
            this.lab2 = lab2;
            this.lab3 = lab3;
            this.lab4 = lab4;
            this.pt1 = pt1;
            this.pt2 = pt2;
            this.pe = pe;
            this.fe = fe;
        }
    }
}
