.class public final Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;
.super Ljava/lang/Object;
.source "SpringAnimReflectUtils.java"


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;

.field private static final TAG:Ljava/lang/String; = "SpringAnimReflectUtils"

.field private static sIsAtEquilibriumMethod:Ljava/lang/reflect/Method;

.field private static sMassStateClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static sMassStateValueField:Ljava/lang/reflect/Field;

.field private static sMassStateVelocityField:Ljava/lang/reflect/Field;

.field private static sSetValueThresholdMethod:Ljava/lang/reflect/Method;

.field private static sUpdateValuesMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final isAtEquilibrium(Lcom/android/quickstep/util/animation/SpringForce;FF)Z
    .locals 3

    .line 1
    const-string v0, "springForce"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->sIsAtEquilibriumMethod:Ljava/lang/reflect/Method;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    const-string v2, "isAtEquilibrium"

    .line 17
    .line 18
    filled-new-array {v1, v1}, [Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->sIsAtEquilibriumMethod:Ljava/lang/reflect/Method;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->sIsAtEquilibriumMethod:Ljava/lang/reflect/Method;

    .line 35
    .line 36
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "null cannot be cast to non-null type kotlin.Boolean"

    .line 56
    .line 57
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    check-cast p0, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    return p0

    .line 67
    :catch_0
    move-exception p0

    .line 68
    const-string p1, "SpringAnimReflectUtils"

    .line 69
    .line 70
    const-string p2, "Error occur while reflect isAtEquilibrium"

    .line 71
    .line 72
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return p0
.end method

.method public static final setValueThreshold(Lcom/android/quickstep/util/animation/SpringForce;D)V
    .locals 1

    .line 1
    const-string v0, "springForce"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setValueThreshold(D)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;
    .locals 0

    .line 1
    const-string p7, "springForce"

    .line 2
    .line 3
    invoke-static {p0, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual/range {p0 .. p6}, Lcom/android/quickstep/util/animation/SpringForce;->updateValues(DDJ)Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 11
    .line 12
    iget p2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mValue:F

    .line 13
    .line 14
    iget p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mVelocity:F

    .line 15
    .line 16
    invoke-direct {p1, p2, p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;-><init>(FF)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method
