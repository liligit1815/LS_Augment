.class public Lcom/zte/mifavor/widget/ListView;
.super Landroid/widget/ListView;
.source "ListView.java"

# interfaces
.implements Lcom/zte/mifavor/widget/j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/ListView$c;,
        Lcom/zte/mifavor/widget/ListView$b;
    }
.end annotation


# instance fields
.field private g:Lb4/e;

.field private h:I

.field private i:Z

.field private j:Z

.field private k:Lc4/h;

.field private l:Lc4/c;

.field private m:Landroid/view/GestureDetector;

.field private n:I

.field private o:Landroid/util/SparseArray;

.field private p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x1010074

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/zte/mifavor/widget/ListView;->h:I

    const/4 p3, 0x1

    .line 6
    iput-boolean p3, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 7
    iput-boolean p3, p0, Lcom/zte/mifavor/widget/ListView;->j:Z

    const/4 p4, 0x0

    .line 8
    iput-object p4, p0, Lcom/zte/mifavor/widget/ListView;->l:Lc4/c;

    .line 9
    iput p3, p0, Lcom/zte/mifavor/widget/ListView;->n:I

    .line 10
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0, p2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/zte/mifavor/widget/ListView;->o:Landroid/util/SparseArray;

    .line 11
    iput p2, p0, Lcom/zte/mifavor/widget/ListView;->p:I

    .line 12
    new-instance v0, Lb4/e;

    invoke-direct {v0}, Lb4/e;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 13
    sget-object v1, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lb4/e;->s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    invoke-virtual {p0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb4/e;->j(Landroid/content/Context;)V

    .line 15
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListView;->j:Z

    .line 16
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    move p2, p3

    :cond_0
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 17
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    invoke-virtual {p1, p2}, Lb4/e;->B(Z)V

    .line 18
    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance p3, Lcom/zte/mifavor/widget/ListView$c;

    invoke-direct {p3, p0, p4}, Lcom/zte/mifavor/widget/ListView$c;-><init>(Lcom/zte/mifavor/widget/ListView;Lcom/zte/mifavor/widget/l;)V

    invoke-direct {p1, p2, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView;->m:Landroid/view/GestureDetector;

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/ListView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/ListView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ListView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/ListView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ListView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method private getScrollerY()I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lcom/zte/mifavor/widget/ListView;->p:I

    .line 4
    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Lcom/zte/mifavor/widget/ListView;->o:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/zte/mifavor/widget/ListView$b;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget v2, v2, Lcom/zte/mifavor/widget/ListView$b;->a:I

    .line 18
    .line 19
    add-int/2addr v1, v2

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->o:Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/zte/mifavor/widget/ListView$b;

    .line 30
    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    new-instance p0, Lcom/zte/mifavor/widget/ListView$b;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ListView$b;-><init>()V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget p0, p0, Lcom/zte/mifavor/widget/ListView$b;->b:I

    .line 39
    .line 40
    sub-int/2addr v1, p0

    .line 41
    return v1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ListView;->getTranslationY()F

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 21
    .line 22
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 33
    .line 34
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 42
    .line 43
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 51
    .line 52
    invoke-virtual {v0}, Lb4/e;->f()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput v0, p0, Lcom/zte/mifavor/widget/ListView;->h:I

    .line 57
    .line 58
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0
.end method

.method public getInterruptSlideDirection()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ListView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsBeingDragged()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->l:Lc4/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lc4/c;->getIsBeingDragged()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getUseSpring()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCollapsed()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ListView;->isSupportSink()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lb4/e;->t()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public isDisableSink()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->v()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isSupportSink()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ListView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lcom/zte/mifavor/widget/ListView$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/ListView$a;-><init>(Lcom/zte/mifavor/widget/ListView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView;->m:Landroid/view/GestureDetector;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 2
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 3
    new-instance p1, Lc4/h;

    invoke-direct {p1, p0}, Lc4/h;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView;->k:Lc4/h;

    .line 4
    invoke-virtual {p1}, Lc4/h;->b()Lc4/c;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView;->l:Lc4/c;

    return-void
.end method

.method public setDampingRatio(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->y(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setDragAmplitude(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lb4/e;->z(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setInterruptSlideDirection(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ListView;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setSlipAmplitude(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->D(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setStiffness(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->F(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setUseSpring(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ListView;->j:Z

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
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListView;->i:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView;->g:Lb4/e;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lb4/e;->B(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method
