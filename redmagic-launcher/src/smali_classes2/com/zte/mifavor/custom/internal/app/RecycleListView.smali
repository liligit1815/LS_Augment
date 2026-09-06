.class public Lcom/zte/mifavor/custom/internal/app/RecycleListView;
.super Lcom/android/internal/app/AlertController$RecycleListView;
.source "RecycleListView.java"

# interfaces
.implements Lcom/zte/mifavor/widget/j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/custom/internal/app/RecycleListView$TouchGesture;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Z#View-RecycleListView"


# instance fields
.field private iOverScrollDecor:Lc4/c;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mIsDispalyMotion:Z

.field private mIsUseSpring:Z

.field private mOverScrollDecoratorHelper:Lc4/h;

.field private mSpringAnimationCommon:Lb4/e;

.field private mTotalyDy:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/custom/internal/app/RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AlertController$RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mTotalyDy:I

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 5
    iput-boolean v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsDispalyMotion:Z

    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->iOverScrollDecor:Lc4/c;

    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ListView in, context = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Z#View-RecycleListView"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    new-instance v2, Lb4/e;

    invoke-direct {v2}, Lb4/e;-><init>()V

    iput-object v2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    .line 9
    sget-object v4, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    const/4 v5, 0x0

    invoke-virtual {v2, p0, v4, v5}, Lb4/e;->s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 10
    iget-object v2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    invoke-virtual {p0}, Lcom/android/internal/app/AlertController$RecycleListView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v4}, Lb4/e;->j(Landroid/content/Context;)V

    .line 11
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsDispalyMotion:Z

    .line 12
    iget-boolean v2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    move p2, v0

    :cond_0
    iput-boolean p2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 13
    iget-object p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    invoke-virtual {p1, p2}, Lb4/e;->B(Z)V

    .line 14
    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/internal/app/AlertController$RecycleListView;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lcom/zte/mifavor/custom/internal/app/RecycleListView$TouchGesture;

    invoke-direct {v0, p0, v1}, Lcom/zte/mifavor/custom/internal/app/RecycleListView$TouchGesture;-><init>(Lcom/zte/mifavor/custom/internal/app/RecycleListView;Lcom/zte/mifavor/custom/internal/app/a;)V

    invoke-direct {p1, p2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "ListView out. mIsDispalyMotion = "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p2, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsDispalyMotion:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p2, ", mIsUseSpring = "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/custom/internal/app/RecycleListView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/custom/internal/app/RecycleListView;)Lb4/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/custom/internal/app/RecycleListView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mTotalyDy:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/custom/internal/app/RecycleListView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mTotalyDy:I

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
    iget-object v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    .line 9
    .line 10
    invoke-virtual {v0}, Lb4/e;->f()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mTotalyDy:I

    .line 15
    .line 16
    :goto_0
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertController$RecycleListView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

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
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->iOverScrollDecor:Lc4/c;

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
    iget-boolean p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCollapsed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

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

.method public isDisableSink()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    .line 2
    .line 3
    invoke-static {p0}, Lb4/f;->c(Lb4/e;)Z

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
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

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
    invoke-super {p0}, Lcom/android/internal/app/AlertController$RecycleListView;->onFinishInflate()V

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
    iget-boolean v1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

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
    const-string v1, "Z#View-RecycleListView"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Lcom/zte/mifavor/custom/internal/app/RecycleListView$1;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/zte/mifavor/custom/internal/app/RecycleListView$1;-><init>(Lcom/zte/mifavor/custom/internal/app/RecycleListView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AlertController$RecycleListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

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
    const-string v1, "Z#View-RecycleListView"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mGestureDetector:Landroid/view/GestureDetector;

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
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertController$RecycleListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

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

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 1

    .line 2
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertController$RecycleListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 3
    const-string p1, "Z#View-RecycleListView"

    const-string v0, "setAdapter in "

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    new-instance p1, Lc4/h;

    invoke-direct {p1, p0}, Lc4/h;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mOverScrollDecoratorHelper:Lc4/h;

    .line 5
    invoke-virtual {p1}, Lc4/h;->b()Lc4/c;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->iOverScrollDecor:Lc4/c;

    return-void
.end method

.method public setUseSpring(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsDispalyMotion:Z

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
    iput-boolean p1, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mIsUseSpring:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;->mSpringAnimationCommon:Lb4/e;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lb4/f;->e(Lb4/e;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
