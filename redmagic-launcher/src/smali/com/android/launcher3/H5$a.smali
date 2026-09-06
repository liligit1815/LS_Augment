.class public Lcom/android/launcher3/H5$a;
.super Ljava/lang/Object;
.source "ResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/H5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:J

.field private e:I

.field private f:I

.field private g:I

.field private h:Lcom/android/launcher3/util/E;

.field private i:Landroid/content/ComponentName;

.field private j:J


# direct methods
.method public constructor <init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/launcher3/H5$a;->a:I

    .line 3
    iput p2, p0, Lcom/android/launcher3/H5$a;->b:I

    .line 4
    iput p3, p0, Lcom/android/launcher3/H5$a;->c:I

    .line 5
    iput-wide p4, p0, Lcom/android/launcher3/H5$a;->d:J

    .line 6
    iput p6, p0, Lcom/android/launcher3/H5$a;->e:I

    .line 7
    iput p7, p0, Lcom/android/launcher3/H5$a;->f:I

    .line 8
    iput p8, p0, Lcom/android/launcher3/H5$a;->g:I

    .line 9
    invoke-static {p11, p9}, Lcom/android/launcher3/H5;->D1(Landroid/content/Context;Landroid/os/UserHandle;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/H5$a;->j:J

    .line 10
    new-instance p1, Lcom/android/launcher3/util/E;

    invoke-direct {p1, p10, p9}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    iput-object p1, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 11
    iput-object p10, p0, Lcom/android/launcher3/H5$a;->i:Landroid/content/ComponentName;

    return-void
.end method

.method public constructor <init>(IIIJLandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 13
    iput v0, p0, Lcom/android/launcher3/H5$a;->e:I

    .line 14
    iput v0, p0, Lcom/android/launcher3/H5$a;->f:I

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/android/launcher3/H5$a;->g:I

    .line 16
    iput p1, p0, Lcom/android/launcher3/H5$a;->a:I

    .line 17
    iput p2, p0, Lcom/android/launcher3/H5$a;->b:I

    .line 18
    iput p3, p0, Lcom/android/launcher3/H5$a;->c:I

    .line 19
    iput-wide p4, p0, Lcom/android/launcher3/H5$a;->d:J

    .line 20
    sget-object p1, LD1/t;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {p1, p8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, LD1/t;

    .line 21
    invoke-virtual {p1, p6}, LD1/t;->m(Landroid/os/UserHandle;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/H5$a;->j:J

    .line 22
    new-instance p1, Lcom/android/launcher3/util/E;

    invoke-direct {p1, p7, p6}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    iput-object p1, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 23
    iput-object p7, p0, Lcom/android/launcher3/H5$a;->i:Landroid/content/ComponentName;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 25
    iput v0, p0, Lcom/android/launcher3/H5$a;->e:I

    .line 26
    iput v0, p0, Lcom/android/launcher3/H5$a;->f:I

    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/android/launcher3/H5$a;->g:I

    .line 28
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    iput v0, p0, Lcom/android/launcher3/H5$a;->a:I

    .line 29
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    iput v0, p0, Lcom/android/launcher3/H5$a;->b:I

    .line 30
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    iput v0, p0, Lcom/android/launcher3/H5$a;->c:I

    .line 31
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/launcher3/H5$a;->d:J

    .line 32
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-static {p1, v0}, Lcom/android/launcher3/H5;->D1(Landroid/content/Context;Landroid/os/UserHandle;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/launcher3/H5$a;->j:J

    .line 33
    new-instance p1, Lcom/android/launcher3/util/E;

    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v0

    iget-object v1, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-direct {p1, v0, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    iput-object p1, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 34
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/H5$a;->i:Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Lcom/android/launcher3/util/E;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/H5$a;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    instance-of v0, p1, Lcom/android/launcher3/H5$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/H5$a;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/H5$a;->c()Lcom/android/launcher3/util/E;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/E;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$a;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/Long;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/H5$a;->j:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "AppLocation info:  mComponentKey="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/H5$a;->h:Lcom/android/launcher3/util/E;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " mScreenId="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/H5$a;->c:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, " mContainer="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-wide v1, p0, Lcom/android/launcher3/H5$a;->d:J

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, " mType="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/H5$a;->g:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, " cell("

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lcom/android/launcher3/H5$a;->a:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, ","

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v2, p0, Lcom/android/launcher3/H5$a;->b:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, ") span("

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v2, p0, Lcom/android/launcher3/H5$a;->e:I

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget v1, p0, Lcom/android/launcher3/H5$a;->f:I

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v1, ") mUser="

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-wide v1, p0, Lcom/android/launcher3/H5$a;->j:J

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method
