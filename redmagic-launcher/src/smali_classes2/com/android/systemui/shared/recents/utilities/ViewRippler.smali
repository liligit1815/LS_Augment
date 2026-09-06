.class public Lcom/android/systemui/shared/recents/utilities/ViewRippler;
.super Ljava/lang/Object;
.source "ViewRippler.java"


# static fields
.field private static final RIPPLE_INTERVAL_MS:I = 0x7d0

.field private static final RIPPLE_OFFSET_MS:I = 0x32


# instance fields
.field private final mRipple:Ljava/lang/Runnable;

.field private mRoot:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/systemui/shared/recents/utilities/ViewRippler$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/recents/utilities/ViewRippler$1;-><init>(Lcom/android/systemui/shared/recents/utilities/ViewRippler;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic a(Lcom/android/systemui/shared/recents/utilities/ViewRippler;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public start(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->stop()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 7
    .line 8
    const-wide/16 v1, 0x32

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 16
    .line 17
    const-wide/16 v1, 0x7d0

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 25
    .line 26
    const-wide/16 v1, 0xfa0

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 34
    .line 35
    const-wide/16 v1, 0x1770

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 43
    .line 44
    const-wide/16 v0, 0x1f40

    .line 45
    .line 46
    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRoot:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/systemui/shared/recents/utilities/ViewRippler;->mRipple:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
