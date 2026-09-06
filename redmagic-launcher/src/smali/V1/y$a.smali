.class final LV1/y$a;
.super Ljava/lang/Object;
.source "BubbleBarViewAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LV1/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LV1/y$a$a;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field private final b:Ljava/lang/Runnable;

.field private final c:Ljava/lang/Runnable;

.field private final d:Z

.field private final e:LV1/y$a$a;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;)V
    .locals 1

    const-string v0, "bubbleView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "showAnimation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "hideAnimation"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "state"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 3
    iput-object p2, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 4
    iput-object p3, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 5
    iput-boolean p4, p0, LV1/y$a;->d:Z

    .line 6
    iput-object p5, p0, LV1/y$a;->e:LV1/y$a$a;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILkotlin/jvm/internal/j;)V
    .locals 6

    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_0

    .line 7
    sget-object p5, LV1/y$a$a;->g:LV1/y$a$a;

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    .line 8
    invoke-direct/range {v0 .. v5}, LV1/y$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;)V

    return-void
.end method

.method public static synthetic b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;
    .locals 0

    .line 1
    and-int/lit8 p7, p6, 0x1

    .line 2
    .line 3
    if-eqz p7, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p7, p6, 0x2

    .line 8
    .line 9
    if-eqz p7, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p7, p6, 0x4

    .line 14
    .line 15
    if-eqz p7, :cond_2

    .line 16
    .line 17
    iget-object p3, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p7, p6, 0x8

    .line 20
    .line 21
    if-eqz p7, :cond_3

    .line 22
    .line 23
    iget-boolean p4, p0, LV1/y$a;->d:Z

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p6, p6, 0x10

    .line 26
    .line 27
    if-eqz p6, :cond_4

    .line 28
    .line 29
    iget-object p5, p0, LV1/y$a;->e:LV1/y$a$a;

    .line 30
    .line 31
    :cond_4
    move p6, p4

    .line 32
    move-object p7, p5

    .line 33
    move-object p4, p2

    .line 34
    move-object p5, p3

    .line 35
    move-object p2, p0

    .line 36
    move-object p3, p1

    .line 37
    invoke-virtual/range {p2 .. p7}, LV1/y$a;->a(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;)LV1/y$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;)LV1/y$a;
    .locals 6

    .line 1
    const-string p0, "bubbleView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "showAnimation"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "hideAnimation"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "state"

    .line 17
    .line 18
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, LV1/y$a;

    .line 22
    .line 23
    move-object v1, p1

    .line 24
    move-object v2, p2

    .line 25
    move-object v3, p3

    .line 26
    move v4, p4

    .line 27
    move-object v5, p5

    .line 28
    invoke-direct/range {v0 .. v5}, LV1/y$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LV1/y$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
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
    instance-of v1, p1, LV1/y$a;

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
    check-cast p1, LV1/y$a;

    .line 12
    .line 13
    iget-object v1, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 14
    .line 15
    iget-object v3, p1, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object v1, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 25
    .line 26
    iget-object v3, p1, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 27
    .line 28
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-object v1, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 36
    .line 37
    iget-object v3, p1, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    iget-boolean v1, p0, LV1/y$a;->d:Z

    .line 47
    .line 48
    iget-boolean v3, p1, LV1/y$a;->d:Z

    .line 49
    .line 50
    if-eq v1, v3, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    iget-object p0, p0, LV1/y$a;->e:LV1/y$a$a;

    .line 54
    .line 55
    iget-object p1, p1, LV1/y$a;->e:LV1/y$a$a;

    .line 56
    .line 57
    if-eq p0, p1, :cond_6

    .line 58
    .line 59
    return v2

    .line 60
    :cond_6
    return v0
.end method

.method public final f()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()LV1/y$a$a;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y$a;->e:LV1/y$a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

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
    iget-object v1, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

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
    iget-boolean v1, p0, LV1/y$a;->d:Z

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x1f

    .line 35
    .line 36
    iget-object p0, p0, LV1/y$a;->e:LV1/y$a$a;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Enum;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    add-int/2addr v0, p0

    .line 43
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, LV1/y$a;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    iget-object v1, p0, LV1/y$a;->b:Ljava/lang/Runnable;

    .line 4
    .line 5
    iget-object v2, p0, LV1/y$a;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    iget-boolean v3, p0, LV1/y$a;->d:Z

    .line 8
    .line 9
    iget-object p0, p0, LV1/y$a;->e:LV1/y$a$a;

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v5, "AnimatingBubble(bubbleView="

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, ", showAnimation="

    .line 25
    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ", hideAnimation="

    .line 33
    .line 34
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", expand="

    .line 41
    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, ", state="

    .line 49
    .line 50
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, ")"

    .line 57
    .line 58
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
