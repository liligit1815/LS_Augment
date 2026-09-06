.class public Lcom/android/launcher3/util/L1;
.super Ljava/lang/Object;
.source "PackageUserKey.java"


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Landroid/os/UserHandle;

.field private d:I

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILandroid/os/UserHandle;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string v0, ""

    invoke-direct {p0, v0, p1, p2}, Lcom/android/launcher3/util/L1;->f(Ljava/lang/String;ILandroid/os/UserHandle;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/util/E;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/L1;->e(Lcom/android/launcher3/util/E;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/L1;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    return-void
.end method

.method public static a(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 20
    .line 21
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public static b(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-direct {v1, v2, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/L1;-><init>(Lcom/android/launcher3/util/E;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static c(Landroid/service/notification/StatusBarNotification;)Lcom/android/launcher3/util/L1;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Landroid/service/notification/StatusBarNotification;->getUser()Landroid/os/UserHandle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Lcom/android/launcher3/util/L1;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/util/L1;-><init>(ILandroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 27
    .line 28
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method private e(Lcom/android/launcher3/util/E;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/android/launcher3/util/L1;->d:I

    .line 30
    .line 31
    iget-object p1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method

.method private f(Ljava/lang/String;ILandroid/os/UserHandle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/util/L1;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 6
    .line 7
    filled-new-array {p1, p3}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/android/launcher3/util/L1;->d:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/android/launcher3/util/L1;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget v0, p0, Lcom/android/launcher3/util/L1;->b:I

    .line 29
    .line 30
    iget v3, p1, Lcom/android/launcher3/util/L1;->b:I

    .line 31
    .line 32
    if-ne v0, v3, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 37
    .line 38
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    return v2

    .line 45
    :cond_1
    return v1

    .line 46
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    return v2

    .line 77
    :cond_3
    return v1
.end method

.method public g(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/util/L1;->f(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/L1;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/L1;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "#"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ",category="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget p0, p0, Lcom/android/launcher3/util/L1;->b:I

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
