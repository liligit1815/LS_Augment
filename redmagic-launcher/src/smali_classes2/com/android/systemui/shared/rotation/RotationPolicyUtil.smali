.class public final Lcom/android/systemui/shared/rotation/RotationPolicyUtil;
.super Ljava/lang/Object;
.source "RotationPolicyUtil.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/systemui/shared/rotation/RotationPolicyUtil;->Companion:Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final isRotationLocked(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/systemui/shared/rotation/RotationPolicyUtil;->Companion:Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/rotation/RotationPolicyUtil$Companion;->isRotationLocked(Landroid/content/Context;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
