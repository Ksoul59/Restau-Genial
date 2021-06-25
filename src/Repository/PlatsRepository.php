<?php

namespace App\Repository;

use App\Data\SearchData;
use App\Entity\Plats;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\Pagination\PaginationInterface;
use Knp\Component\Pager\PaginatorInterface;

/**
 * @method Plats|null find($id, $lockMode = null, $lockVersion = null)
 * @method Plats|null findOneBy(array $criteria, array $orderBy = null)
 * @method Plats[]    findAll()
 * @method Plats[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PlatsRepository extends ServiceEntityRepository
{

    /**
     * @return PaginatorInterface
     */
    private $paginator;

    public function __construct(ManagerRegistry $registry, PaginatorInterface $paginator)
    {
        parent::__construct($registry, Plats::class);
        $this->paginator = $paginator;
    }

/**
 * Récupère les produits en lien avec une recherche
 *
 * @return PaginatorInterface
 */
    public function findSearch(SearchData $search): PaginationInterface
    {

        $query = $this
            ->createQueryBuilder('p')
            ->select('c', 'p')
            ->join('p.categories', 'c');

        if (!empty($search->q)) {
            $query = $query
                ->andWhere('p.name LIKE :q')
                ->setParameter('q', "%{$search->q}%");
        }

        if (!empty($search->min)) {
            $query = $query
                ->andWhere('p.min >= :q')
                ->setParameter('min', $search->min);
        }

        if (!empty($search->max)) {
            $query = $query
                ->andWhere('p.max <= :q')
                ->setParameter('max', $search->max);
        }

        if (!empty($search->categories)) {
            $query = $query
                ->andWhere('c.id IN (:categories)')
                ->setParameter('categories', $search->categories);
        }

        $query = $query->getQuery();
        return $this->paginator->paginate(
            $query,
            $search->page,
            4
        );
    }

}
