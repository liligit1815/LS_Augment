.class public final Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;
.super Ljava/lang/Object;
.source "DeviceConfigHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/DeviceConfigHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DebugInfo"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final desc:Ljava/lang/String;

.field private final isInt:Z

.field private final key:Ljava/lang/String;

.field private final valueInCode:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZTT;)V"
        }
    .end annotation

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "desc"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->key:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->desc:Ljava/lang/String;

    .line 17
    .line 18
    iput-boolean p3, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->isInt:Z

    .line 19
    .line 20
    iput-object p4, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->valueInCode:Ljava/lang/Object;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final getDesc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->desc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getValueInCode()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->valueInCode:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isInt()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->isInt:Z

    .line 2
    .line 3
    return p0
.end method
