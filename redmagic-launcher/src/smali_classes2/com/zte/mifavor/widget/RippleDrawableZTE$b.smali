.class Lcom/zte/mifavor/widget/RippleDrawableZTE$b;
.super Ljava/lang/Object;
.source "RippleDrawableZTE.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/RippleDrawableZTE;->createRippleExitAnim(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/RippleDrawableZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$b;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$b;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->g(Lcom/zte/mifavor/widget/RippleDrawableZTE;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$b;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
