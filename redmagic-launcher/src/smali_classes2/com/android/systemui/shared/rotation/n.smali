.class public final synthetic Lcom/android/systemui/shared/rotation/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/rotation/n;->a:Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/systemui/shared/rotation/n;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/n;->a:Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/systemui/shared/rotation/n;->b:I

    .line 4
    .line 5
    check-cast p1, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;->c(Lcom/android/systemui/shared/rotation/RotationButtonController$TaskStackListenerImpl;ILandroid/app/ActivityManager$RunningTaskInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
