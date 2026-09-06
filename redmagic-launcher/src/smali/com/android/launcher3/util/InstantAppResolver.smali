.class public Lcom/android/launcher3/util/InstantAppResolver;
.super Ljava/lang/Object;
.source "InstantAppResolver.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/android/launcher3/util/InstantAppResolver;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/util/InstantAppResolver;

    .line 2
    .line 3
    const v1, 0x7f140216

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/util/InstantAppResolver;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public isInstantApp(Landroid/content/pm/ApplicationInfo;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public isInstantApp(Lcom/android/launcher3/model/data/d;)Z
    .locals 0

    .line 2
    const/4 p0, 0x0

    return p0
.end method

.method public isInstantApp(Ljava/lang/String;I)Z
    .locals 0

    .line 3
    const/4 p0, 0x0

    return p0
.end method
