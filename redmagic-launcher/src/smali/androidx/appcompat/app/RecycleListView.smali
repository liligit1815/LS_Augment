.class public Landroidx/appcompat/app/RecycleListView;
.super Landroidx/appcompat/app/AlertController$RecycleListView;
.source "RecycleListView.java"

# interfaces
.implements Lcom/zte/mifavor/widget/j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/RecycleListView$b;
    }
.end annotation


# instance fields
.field private i:Lb4/e;

.field private j:I

.field private k:Z

.field private l:Z

.field private m:Lc4/h;

.field private n:Lc4/c;

.field private o:Landroid/view/GestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/app/AlertController$RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Landroidx/appcompat/app/RecycleListView;->j:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Landroidx/appcompat/app/RecycleListView;->l:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Landroidx/appcompat/app/RecycleListView;->n:Lc4/c;

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, "ListView in, context = "

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, "Z#View-RecycleListViewX"

    .line 33
    .line 34
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    new-instance v2, Lb4/e;

    .line 38
    .line 39
    invoke-direct {v2}, Lb4/e;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 43
    .line 44
    sget-object v4, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 45
    .line 46
    const/4 v5, 0x0

    .line 47
    invoke-virtual {v2, p0, v4, v5}, Lb4/e;->s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v2, v4}, Lb4/e;->j(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput-boolean p1, p0, Landroidx/appcompat/app/RecycleListView;->l:Z

    .line 68
    .line 69
    iget-boolean v2, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 70
    .line 71
    if-eqz v2, :cond_0

    .line 72
    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    move p2, v0

    .line 76
    :cond_0
    iput-boolean p2, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 77
    .line 78
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Lb4/e;->B(Z)V

    .line 81
    .line 82
    .line 83
    new-instance p1, Landroid/view/GestureDetector;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    new-instance v0, Landroidx/appcompat/app/RecycleListView$b;

    .line 90
    .line 91
    invoke-direct {v0, p0, v1}, Landroidx/appcompat/app/RecycleListView$b;-><init>(Landroidx/appcompat/app/RecycleListView;Landroidx/appcompat/app/q;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p1, p2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView;->o:Landroid/view/GestureDetector;

    .line 98
    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string p2, "ListView out. mIsDispalyMotion = "

    .line 105
    .line 106
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-boolean p2, p0, Landroidx/appcompat/app/RecycleListView;->l:Z

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p2, ", mIsUseSpring = "

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-boolean p0, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method static bridge synthetic b(Landroidx/appcompat/app/RecycleListView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Landroidx/appcompat/app/RecycleListView;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/app/RecycleListView;->j:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Landroidx/appcompat/app/RecycleListView;I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/app/RecycleListView;->j:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 9
    .line 10
    invoke-virtual {v0}, Lb4/e;->f()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Landroidx/appcompat/app/RecycleListView;->j:I

    .line 15
    .line 16
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public getIsBeingDragged()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView;->n:Lc4/c;

    .line 2
    .line 3
    invoke-static {p0}, Lb4/f;->a(Lc4/c;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUseSpring()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCollapsed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 2
    .line 3
    invoke-static {p0}, Lb4/f;->b(Lb4/e;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSupportSink()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 2
    .line 3
    invoke-static {p0}, Lb4/f;->d(Lb4/e;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/ListView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "onFinishInflate in. mIsUseSpring = "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v1, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "Z#View-RecycleListViewX"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Landroidx/appcompat/app/RecycleListView$a;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Landroidx/appcompat/app/RecycleListView$a;-><init>(Landroidx/appcompat/app/RecycleListView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "+++++++++++++++++++ onTouchEvent ev = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "Z#View-RecycleListViewX"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Landroidx/appcompat/app/RecycleListView;->o:Landroid/view/GestureDetector;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/RecycleListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 2
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 3
    new-instance p1, Lc4/h;

    invoke-direct {p1, p0}, Lc4/h;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView;->m:Lc4/h;

    .line 4
    invoke-virtual {p1}, Lc4/h;->b()Lc4/c;

    move-result-object p1

    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView;->n:Lc4/c;

    return-void
.end method

.method public setUseSpring(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Landroidx/appcompat/app/RecycleListView;->l:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iput-boolean p1, p0, Landroidx/appcompat/app/RecycleListView;->k:Z

    .line 11
    .line 12
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView;->i:Lb4/e;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lb4/f;->e(Lb4/e;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
