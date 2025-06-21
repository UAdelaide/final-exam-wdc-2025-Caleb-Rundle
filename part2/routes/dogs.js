
router.get('/allDogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  return res.send(rows);
});