.class public final synthetic Lcom/android/quickstep/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/AbsSwipeUpHandler;

.field public final synthetic h:F

.field public final synthetic i:Z

.field public final synthetic j:Landroid/graphics/PointF;

.field public final synthetic k:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;FZLandroid/graphics/PointF;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/u;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/u;->h:F

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/u;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/u;->j:Landroid/graphics/PointF;

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/quickstep/u;->k:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/u;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/u;->h:F

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/quickstep/u;->i:Z

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/u;->j:Landroid/graphics/PointF;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/quickstep/u;->k:Z

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->M(Lcom/android/quickstep/AbsSwipeUpHandler;FZLandroid/graphics/PointF;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
