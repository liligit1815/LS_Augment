.class Lc4/a$a;
.super Ljava/lang/Object;
.source "BaseOverScrollBounceEffectDecorator.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc4/a;-><init>(Ld4/c;FFFLandroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lc4/a;


# direct methods
.method constructor <init>(Lc4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lc4/a$a;->a:Lc4/a;

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
    iget-object p1, p0, Lc4/a$a;->a:Lc4/a;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p1, p2}, Lc4/a;->h(Lc4/a;Z)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p2, "on Animation End. +++++++++++++++++++++ mIsBeingDragged = "

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lc4/a$a;->a:Lc4/a;

    .line 18
    .line 19
    invoke-static {p2}, Lc4/a;->b(Lc4/a;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string p2, "Z#QScrollBaseDecorator"

    .line 31
    .line 32
    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lc4/a$a;->a:Lc4/a;

    .line 36
    .line 37
    invoke-static {p1}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lc4/a$a;->a:Lc4/a;

    .line 45
    .line 46
    iget-object p1, p0, Lc4/a;->k:Lc4/a$f;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lc4/a;->z(Lc4/a$e;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
