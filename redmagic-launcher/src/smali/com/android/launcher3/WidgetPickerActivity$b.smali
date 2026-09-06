.class final Lcom/android/launcher3/WidgetPickerActivity$b;
.super Lcom/android/tools/r8/RecordTag;
.source "WidgetPickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/WidgetPickerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final a:Z

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;


# direct methods
.method private constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/tools/r8/RecordTag;-><init>()V

    iput-boolean p1, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    iput-object p2, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/b6;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/WidgetPickerActivity$b;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic a(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 8
    .line 9
    iget-boolean v1, p1, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private synthetic b()[Ljava/lang/Object;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    new-array v2, v2, [Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    aput-object v0, v2, v3

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    aput-object v1, v2, v0

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    aput-object p0, v2, v0

    .line 22
    .line 23
    return-object v2
.end method

.method static bridge synthetic c(Lcom/android/launcher3/WidgetPickerActivity$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method d()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    const-string v1, "WidgetPickerActivity"

    .line 3
    .line 4
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v3, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    const-string v3, "accepted"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v3, "rejected"

    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 32
    .line 33
    filled-new-array {v2, v3, p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v2, "%s: %s because %s"

    .line 38
    .line 39
    invoke-static {v0, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity$b;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/Z5;->a(ZLjava/lang/Object;Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity$b;->b()[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 6
    .line 7
    const-string v1, "a;b;c"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/a6;->a([Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
