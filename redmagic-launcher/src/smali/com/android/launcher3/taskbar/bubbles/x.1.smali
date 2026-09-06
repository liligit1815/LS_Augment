.class public final Lcom/android/launcher3/taskbar/bubbles/x;
.super Lcom/android/launcher3/taskbar/bubbles/u;
.source "BubbleBarItem.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/x$a;
    }
.end annotation


# static fields
.field public static final d:Lcom/android/launcher3/taskbar/bubbles/x$a;


# instance fields
.field private c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/x$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/x$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/bubbles/x;->d:Lcom/android/launcher3/taskbar/bubbles/x$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 2

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "Overflow"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {p0, v0, p1, v1}, Lcom/android/launcher3/taskbar/bubbles/u;-><init>(Ljava/lang/String;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lkotlin/jvm/internal/j;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/taskbar/bubbles/x;

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
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/x;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    return v0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/x;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "BubbleBarOverflow(view="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ")"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
