.class public final synthetic Lcom/android/quickstep/views/Y0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/Y0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/Y0;->b:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/views/Y0;->c:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/Y0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/Y0;->b:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/views/Y0;->c:F

    .line 6
    .line 7
    check-cast p1, Landroid/view/MotionEvent;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/views/RecentsView;->y0(Lcom/android/quickstep/views/RecentsView;FFLandroid/view/MotionEvent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
