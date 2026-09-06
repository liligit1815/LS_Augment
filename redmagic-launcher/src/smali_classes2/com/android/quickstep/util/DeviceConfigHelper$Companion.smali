.class public final Lcom/android/quickstep/util/DeviceConfigHelper$Companion;
.super Ljava/lang/Object;
.source "DeviceConfigHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/DeviceConfigHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAllProps()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/DeviceConfigHelper;->access$getAllProps$cp()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getPrefs()Landroid/content/SharedPreferences;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/DeviceConfigHelper;->access$getPrefs$delegate$cp()Lh4/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "getValue(...)"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    check-cast p0, Landroid/content/SharedPreferences;

    .line 15
    .line 16
    return-object p0
.end method
