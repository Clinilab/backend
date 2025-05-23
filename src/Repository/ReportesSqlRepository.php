<?php

namespace App\Repository;

use App\Entity\ReportesSql;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReportesSql|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReportesSql|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReportesSql[]    findAll()
 * @method ReportesSql[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReportesSqlRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReportesSql::class);
    }

    // /**
    //  * @return ReportesSql[] Returns an array of ReportesSql objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ReportesSql
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
