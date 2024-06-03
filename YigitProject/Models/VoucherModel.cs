namespace YigitProject.Models
{
    public class VoucherModel
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public BoundingPoly boundingPoly { get; set; }

        public class BoundingPoly
        {
            public List<Vertex> Vertices { get; set; }
        }

        public class Vertex
        {
            public int X { get; set; }
            public int Y { get; set; }
        }
    }
}
