.class public interface abstract Lcom/android/launcher3/dragndrop/y;
.super Ljava/lang/Object;
.source "DraggableView.java"


# direct methods
.method public static synthetic f()V
    .locals 0

    .line 1
    return-void
.end method

.method public static h(I)Lcom/android/launcher3/dragndrop/y;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/dragndrop/x;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic j(I)I
    .locals 0

    .line 1
    return p0
.end method


# virtual methods
.method public d(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Lcom/android/launcher3/util/a2;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/dragndrop/w;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/w;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public g(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/launcher3/dragndrop/y;->d(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract getViewType()I
.end method
