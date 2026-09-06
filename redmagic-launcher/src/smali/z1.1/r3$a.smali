.class Lz1/r3$a;
.super Ljava/lang/Object;
.source "ModelUtils.java"

# interfaces
.implements Ljava/util/function/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lz1/r3;->b(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/P2;)Ljava/util/function/Predicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Predicate<",
        "Lcom/android/launcher3/model/data/y;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/P2;

.field final synthetic b:Lcom/android/launcher3/util/z0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/P2;Lcom/android/launcher3/util/z0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lz1/r3$a;->a:Lcom/android/launcher3/P2;

    .line 2
    .line 3
    iput-object p2, p0, Lz1/r3$a;->b:Lcom/android/launcher3/util/z0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/r3$a;->a:Lcom/android/launcher3/P2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/b0;->h()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lz1/r3$a;->a:Lcom/android/launcher3/P2;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/b0;->h()Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v0, "currentScreenContentFilter: not add! "

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "ModelUtils"

    .line 59
    .line 60
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 65
    .line 66
    const/16 v1, -0x65

    .line 67
    .line 68
    if-eq v0, v1, :cond_2

    .line 69
    .line 70
    const/16 v1, -0x64

    .line 71
    .line 72
    if-ne v0, v1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Lz1/r3$a;->b:Lcom/android/launcher3/util/z0;

    .line 75
    .line 76
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 86
    return p0

    .line 87
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 88
    return p0
.end method

.method public bridge synthetic test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/r3$a;->a(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
