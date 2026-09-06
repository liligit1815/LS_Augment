.class public abstract Lcom/android/launcher3/compat/PermissionManagerCompat;
.super Ljava/lang/Object;
.source "PermissionManagerCompat.java"


# static fields
.field private static sInstance:Lcom/android/launcher3/compat/PermissionManagerCompat;


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

.method public static getInstance()Lcom/android/launcher3/compat/PermissionManagerCompat;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/compat/PermissionManagerCompat;->sInstance:Lcom/android/launcher3/compat/PermissionManagerCompat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/compat/PermissionManagerCompatVM;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/compat/PermissionManagerCompatVM;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/compat/PermissionManagerCompat;->sInstance:Lcom/android/launcher3/compat/PermissionManagerCompat;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/android/launcher3/compat/PermissionManagerCompat;->sInstance:Lcom/android/launcher3/compat/PermissionManagerCompat;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public abstract checkSelfPermission(Ljava/lang/String;Landroid/content/Context;)I
.end method

.method public isPermissionGranted(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/compat/PermissionManagerCompat;->checkSelfPermission(Ljava/lang/String;Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
