.class final synthetic Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;
.super Lkotlin/jvm/internal/m;
.source "DeviceConfigWrapper.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/DeviceConfigWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/l<",
        "Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;",
        "Lcom/android/quickstep/DeviceConfigWrapper;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;->INSTANCE:Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 6

    .line 1
    const-string v4, "<init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;)V"

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const-class v2, Lcom/android/quickstep/DeviceConfigWrapper;

    .line 6
    .line 7
    const-string v3, "<init>"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final invoke(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;)Lcom/android/quickstep/DeviceConfigWrapper;
    .locals 1

    const-string p0, "p0"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    new-instance p0, Lcom/android/quickstep/DeviceConfigWrapper;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/DeviceConfigWrapper;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;Lkotlin/jvm/internal/j;)V

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;->invoke(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;)Lcom/android/quickstep/DeviceConfigWrapper;

    move-result-object p0

    return-object p0
.end method
