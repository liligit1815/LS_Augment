.class public final synthetic Lcom/android/systemui/shared/rotation/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/rotation/RotationButtonController$2;

.field public final synthetic h:I

.field public final synthetic i:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/rotation/RotationButtonController$2;ILjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/rotation/l;->g:Lcom/android/systemui/shared/rotation/RotationButtonController$2;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/systemui/shared/rotation/l;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/systemui/shared/rotation/l;->i:Ljava/lang/Boolean;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/l;->g:Lcom/android/systemui/shared/rotation/RotationButtonController$2;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/systemui/shared/rotation/l;->h:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/systemui/shared/rotation/l;->i:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/systemui/shared/rotation/RotationButtonController$2;->o2(Lcom/android/systemui/shared/rotation/RotationButtonController$2;ILjava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
