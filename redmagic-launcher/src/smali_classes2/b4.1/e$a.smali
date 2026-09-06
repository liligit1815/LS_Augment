.class Lb4/e$a;
.super Ljava/lang/Object;
.source "SpringAnimationCommon.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb4/e;->E(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb4/e;


# direct methods
.method constructor <init>(Lb4/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb4/e$a;->a:Lb4/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p4, "====================== onAnimationEnd. mSpringAnimation  v = "

    .line 7
    .line 8
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p3, ", b = "

    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p3, "Z#QScroll-SpringAnim"

    .line 27
    .line 28
    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lb4/e$a;->a:Lb4/e;

    .line 34
    .line 35
    invoke-static {p1}, Lb4/e;->c(Lb4/e;)Landroidx/dynamicanimation/animation/j;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lb4/e$a;->a:Lb4/e;

    .line 44
    .line 45
    invoke-static {p1}, Lb4/e;->b(Lb4/e;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lb4/e$a;->a:Lb4/e;

    .line 53
    .line 54
    invoke-static {p0}, Lb4/e;->b(Lb4/e;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
