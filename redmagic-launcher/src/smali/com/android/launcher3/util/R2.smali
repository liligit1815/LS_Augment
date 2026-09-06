.class public final synthetic Lcom/android/launcher3/util/R2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/V2;

.field public final synthetic h:I

.field public final synthetic i:F

.field public final synthetic j:Landroid/os/VibrationEffect;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/V2;IFLandroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/R2;->g:Lcom/android/launcher3/util/V2;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/R2;->h:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/util/R2;->i:F

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/util/R2;->j:Landroid/os/VibrationEffect;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/R2;->g:Lcom/android/launcher3/util/V2;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/R2;->h:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/util/R2;->i:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/util/R2;->j:Landroid/os/VibrationEffect;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/util/V2;->d(Lcom/android/launcher3/util/V2;IFLandroid/os/VibrationEffect;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
