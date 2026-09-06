.class Landroidx/appcompat/app/RecycleListView$b;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "RecycleListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/RecycleListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/app/RecycleListView;


# direct methods
.method private constructor <init>(Landroidx/appcompat/app/RecycleListView;)V
    .locals 0

    .line 2
    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/appcompat/app/RecycleListView;Landroidx/appcompat/app/q;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/app/RecycleListView$b;-><init>(Landroidx/appcompat/app/RecycleListView;)V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    .line 1
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 2
    .line 3
    const/4 p2, -0x1

    .line 4
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p2, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p2, v0}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "onFling+++++++++++++++++++++, velocityX = "

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p3, ", velocityY = "

    .line 29
    .line 30
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p3, ", canScrollUp = "

    .line 37
    .line 38
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p1, ", canScrollDown = "

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, ", IsBeingDragged = "

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroidx/appcompat/app/RecycleListView;->getIsBeingDragged()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string p2, "Z#View-RecycleListViewX"

    .line 71
    .line 72
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroidx/appcompat/app/RecycleListView;->getIsBeingDragged()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_1

    .line 82
    .line 83
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 84
    .line 85
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->b(Landroidx/appcompat/app/RecycleListView;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_0

    .line 90
    .line 91
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 92
    .line 93
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-eqz p1, :cond_0

    .line 98
    .line 99
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView$b;->g:Landroidx/appcompat/app/RecycleListView;

    .line 100
    .line 101
    invoke-static {p0}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    neg-float p1, p4

    .line 106
    float-to-int p1, p1

    .line 107
    invoke-virtual {p0, p1}, Lb4/e;->h(I)V

    .line 108
    .line 109
    .line 110
    :cond_0
    return v0

    .line 111
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string p1, "fling+++++++++++++++++++++, ignore fling, velocityY = "

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    const/4 p0, 0x0

    .line 132
    return p0
.end method
