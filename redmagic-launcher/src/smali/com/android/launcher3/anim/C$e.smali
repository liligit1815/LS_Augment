.class Lcom/android/launcher3/anim/C$e;
.super Lcom/zte/activityevent/IActivityEventsCallback$Stub;
.source "AppOCAnimHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/anim/C;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/anim/C;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/anim/C;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/zte/activityevent/IActivityEventsCallback$Stub;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AppOCAnimHelper"

    .line 5
    .line 6
    const-string v1, "Initial AppActivityEventCallBack"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic o2(Lcom/android/launcher3/anim/C$e;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/anim/C$e;->p2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic p2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/anim/C;->d(Lcom/android/launcher3/anim/C;)Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->d(Lcom/android/launcher3/anim/C;)Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/launcher3/anim/C$d;

    .line 33
    .line 34
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/launcher3/anim/C$d;->notifiyActivityEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void

    .line 39
    :cond_2
    :goto_1
    const-string p0, "AppOCAnimHelper"

    .line 40
    .line 41
    const-string p1, "notifiyActivityEvent--helper is null"

    .line 42
    .line 43
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public notifiyActivityEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    const/16 v0, 0x200

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/anim/C;->c(Lcom/android/launcher3/anim/C;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/anim/C;->c(Lcom/android/launcher3/anim/C;)Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0, p2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkPackageInWindow(Landroid/content/Context;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v1, "AM_SET_RESUMED_ACTIVITY received pkgName="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", activity="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "AppOCAnimHelper"

    .line 59
    .line 60
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/anim/C$e;->g:Lcom/android/launcher3/anim/C;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 67
    .line 68
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 69
    .line 70
    new-instance v1, Lcom/android/launcher3/anim/D;

    .line 71
    .line 72
    move-object v2, p0

    .line 73
    move v3, p1

    .line 74
    move-object v4, p2

    .line 75
    move-object v5, p3

    .line 76
    move-object v6, p4

    .line 77
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/anim/D;-><init>(Lcom/android/launcher3/anim/C$e;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
