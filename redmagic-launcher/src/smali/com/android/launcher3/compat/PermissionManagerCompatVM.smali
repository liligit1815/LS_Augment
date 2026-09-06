.class public Lcom/android/launcher3/compat/PermissionManagerCompatVM;
.super Lcom/android/launcher3/compat/PermissionManagerCompat;
.source "PermissionManagerCompatVM.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/compat/PermissionManagerCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public checkSelfPermission(Ljava/lang/String;Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p2, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
