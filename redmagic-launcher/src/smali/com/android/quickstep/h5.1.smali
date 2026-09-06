.class public final synthetic Lcom/android/quickstep/h5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/h5;->a:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/h5;->a:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getThumbnail()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
