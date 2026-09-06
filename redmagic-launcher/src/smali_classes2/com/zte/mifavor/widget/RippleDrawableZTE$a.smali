.class Lcom/zte/mifavor/widget/RippleDrawableZTE$a;
.super Ljava/lang/Object;
.source "RippleDrawableZTE.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/RippleDrawableZTE;->createRippleEnterAnim()V
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
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->e(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v0, "onAnimationCancel Enter Anim ===== value Animator Exit. "

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "RippleDrawableZTE"

    .line 25
    .line 26
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->setAlpha(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->d(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->setRadius(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->c(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/graphics/Paint;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/graphics/Paint;->getAlpha()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 25
    .line 26
    invoke-static {v0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->j(Lcom/zte/mifavor/widget/RippleDrawableZTE;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->a(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->f(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->f(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->c(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/graphics/Paint;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->b(Lcom/zte/mifavor/widget/RippleDrawableZTE;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;->g:Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->i(Lcom/zte/mifavor/widget/RippleDrawableZTE;Landroid/animation/ValueAnimator;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
