<?php

namespace App\Controller;

use App\Repository\PlatsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/panier", name="cart_index")
     */
    public function index(SessionInterface $session, PlatsRepository $platsRepository)
    {

        $panier = $session->get('panier', []);
        $panierwithdata = [];

        foreach ($panier as $id => $quantity) {
            $panierwithdata[] = [
                'product' => $platsRepository->find($id),
                'quantity' => $quantity,
            ];
        }

        $total = 0;

        foreach ($panierwithdata as $item) {
            $totalItem = $item['product']->getPrice() * $item['quantity'];
            $total += $totalItem;
        }

        return $this->render('cart/index.html.twig', [
            'items' => $panierwithdata,
            'total' => $total,
        ]);
    }

    /**
     * @Route("panier/add/{id}", name="cart_add")
     */
    public function add($id, SessionInterface $session)
    {

        $panier = $session->get('panier', []);

        if (!empty($panier[$id])) {
            $panier[$id]++;
        } else {
            $panier[$id] = 1;
        }

        $session->set('panier', $panier);

        return $this->redirectToRoute("cart_index");
    }

    /**
     * @Route("/panier/remove/{id}", name="cart_remove")
     */

    public function remove($id, SessionInterface $session)
    {
        $panier = $session->get('panier', []);

        if ($panier[$id] > 1) {
            $panier[$id]--;
        } else {
            unset($panier[$id]);
        }

        $session->set('panier', $panier);

        return $this->redirectToRoute("cart_index");
    }
    /**
     * @Route("/panier/paiement", name="cart_pay")
     */

    public function pay($id, SessionInterface $session)
    {
        return $this->redirectToRoute("cart_pay");
    }
}
