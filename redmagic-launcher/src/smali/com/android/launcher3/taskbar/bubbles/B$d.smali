.class public final Lcom/android/launcher3/taskbar/bubbles/B$d;
.super Ljava/lang/Object;
.source "BubbleBarSwipeController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/bubbles/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/bubbles/B$a;

.field private b:Lcom/android/launcher3/taskbar/bubbles/B$a;

.field private c:Z

.field private d:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZ)V
    .locals 1

    const-string v0, "startState"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "currentState"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 4
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 5
    iput-boolean p4, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 6
    sget-object p2, Lcom/android/launcher3/taskbar/bubbles/B$a;->g:Lcom/android/launcher3/taskbar/bubbles/B$a;

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 7
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/bubbles/B$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZ)V

    return-void
.end method


# virtual methods
.method public final a()Lcom/android/launcher3/taskbar/bubbles/B$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()Lcom/android/launcher3/taskbar/bubbles/B$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e(Lcom/android/launcher3/taskbar/bubbles/B$a;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 7
    .line 8
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 28
    .line 29
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 30
    .line 31
    if-eq v1, v3, :cond_4

    .line 32
    .line 33
    return v2

    .line 34
    :cond_4
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 35
    .line 36
    iget-boolean p1, p1, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 37
    .line 38
    if-eq p0, p1, :cond_5

    .line 39
    .line 40
    return v2

    .line 41
    :cond_5
    return v0
.end method

.method public final f(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public final g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr v0, p0

    .line 34
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->a:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->b:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->c:Z

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$d;->d:Z

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v4, "SwipeState(startState="

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", currentState="

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ", passedUnstash="

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ", isSwipe="

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ")"

    .line 47
    .line 48
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
