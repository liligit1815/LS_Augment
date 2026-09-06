.class public LN1/f;
.super Ljava/lang/Object;
.source "ShortcutRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN1/f$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/pm/LauncherApps$ShortcutQuery;

.field private final b:Landroid/content/Context;

.field private final c:Landroid/os/UserHandle;

.field d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/content/pm/LauncherApps$ShortcutQuery;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, LN1/f;->d:Z

    .line 13
    .line 14
    iput-object p1, p0, LN1/f;->b:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, LN1/f;->c:Landroid/os/UserHandle;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)LN1/f;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, LN1/f;->b(Ljava/lang/String;Ljava/util/List;)LN1/f;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/util/List;)LN1/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "LN1/f;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setPackage(Ljava/lang/String;)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setShortcutIds(Ljava/util/List;)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public varargs c(Ljava/lang/String;[Ljava/lang/String;)LN1/f;
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, LN1/f;->b(Ljava/lang/String;Ljava/util/List;)LN1/f;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(I)LN1/f$a;
    .locals 2

    .line 1
    iget-boolean v0, p0, LN1/f;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, LN1/f$a;->h:LN1/f$a;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setQueryFlags(I)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 11
    .line 12
    .line 13
    :try_start_0
    new-instance p1, LN1/f$a;

    .line 14
    .line 15
    iget-object v0, p0, LN1/f;->b:Landroid/content/Context;

    .line 16
    .line 17
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 24
    .line 25
    iget-object v1, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 26
    .line 27
    iget-object p0, p0, LN1/f;->c:Landroid/os/UserHandle;

    .line 28
    .line 29
    invoke-virtual {v0, v1, p0}, Landroid/content/pm/LauncherApps;->getShortcuts(Landroid/content/pm/LauncherApps$ShortcutQuery;Landroid/os/UserHandle;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {p1, p0}, LN1/f$a;-><init>(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-object p1

    .line 37
    :catch_0
    move-exception p0

    .line 38
    const-string p1, "ShortcutRequest"

    .line 39
    .line 40
    const-string v0, "Failed to query for shortcuts"

    .line 41
    .line 42
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/logging/b;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, LN1/f$a;->h:LN1/f$a;

    .line 46
    .line 47
    return-object p0
.end method

.method public e(Landroid/content/ComponentName;)LN1/f;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, LN1/f;->d:Z

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object v0, p0, LN1/f;->a:Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setActivity(Landroid/content/ComponentName;)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
