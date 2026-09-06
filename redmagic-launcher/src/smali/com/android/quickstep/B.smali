.class public final synthetic Lcom/android/quickstep/B;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/AbsSwipeUpHandler;

.field public final synthetic h:Landroid/graphics/PointF;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/B;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/B;->h:Landroid/graphics/PointF;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final doFrame(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/B;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/B;->h:Landroid/graphics/PointF;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->k(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/PointF;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
