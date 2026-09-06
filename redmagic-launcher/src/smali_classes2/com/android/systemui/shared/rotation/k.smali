.class public final synthetic Lcom/android/systemui/shared/rotation/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/rotation/RotationButtonController;

.field public final synthetic h:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/rotation/RotationButtonController;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/rotation/k;->g:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/systemui/shared/rotation/k;->h:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/k;->g:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/systemui/shared/rotation/k;->h:Z

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/systemui/shared/rotation/RotationButtonController;->e(Lcom/android/systemui/shared/rotation/RotationButtonController;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
