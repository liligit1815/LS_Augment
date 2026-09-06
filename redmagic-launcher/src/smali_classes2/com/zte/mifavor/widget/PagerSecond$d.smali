.class Lcom/zte/mifavor/widget/PagerSecond$d;
.super Ljava/lang/Object;
.source "PagerSecond.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/PagerSecond;->K(ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "click tab, position = "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->g:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "PagerSecond"

    .line 21
    .line 22
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    :try_start_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/zte/mifavor/widget/PagerSecond;->t(Lcom/zte/mifavor/widget/PagerSecond;)Ljava/lang/reflect/Field;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/zte/mifavor/widget/PagerSecond;->t(Lcom/zte/mifavor/widget/PagerSecond;)Ljava/lang/reflect/Field;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/zte/mifavor/widget/PagerSecond;->A(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/widget/Scroller;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->v(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget v4, LR3/h;->a:I

    .line 54
    .line 55
    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catch_0
    move-exception v1

    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v3, "addTab -onClick : replace interpolator error: "

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->z(Lcom/zte/mifavor/widget/PagerSecond;)Landroidx/viewpager/widget/ViewPager;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget v1, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->g:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 96
    .line 97
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->x(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/os/Handler;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$d;->h:Lcom/zte/mifavor/widget/PagerSecond;

    .line 102
    .line 103
    invoke-static {p0}, Lcom/zte/mifavor/widget/PagerSecond;->x(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/os/Handler;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-wide/16 v1, 0x258

    .line 112
    .line 113
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 114
    .line 115
    .line 116
    return-void
.end method
