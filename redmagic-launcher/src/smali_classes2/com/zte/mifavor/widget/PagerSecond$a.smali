.class Lcom/zte/mifavor/widget/PagerSecond$a;
.super Landroid/os/Handler;
.source "PagerSecond.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/PagerSecond;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 11
    .line 12
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :try_start_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->t(Lcom/zte/mifavor/widget/PagerSecond;)Ljava/lang/reflect/Field;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->t(Lcom/zte/mifavor/widget/PagerSecond;)Ljava/lang/reflect/Field;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->A(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/widget/Scroller;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$a;->a:Lcom/zte/mifavor/widget/PagerSecond;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/zte/mifavor/widget/PagerSecond;->y(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, v0, p0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v0, "mHandler RESET_INTERPOLATOR: replace interpolator error: "

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "PagerSecond"

    .line 69
    .line 70
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    :goto_0
    return-void
.end method
