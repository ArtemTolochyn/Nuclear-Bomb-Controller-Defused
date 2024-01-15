enum AttackType
{
  boosted,
  simple
}

class AttackState
{
  AttackType attackType;
  AttackState({required this.attackType});
}
