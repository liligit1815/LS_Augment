.class Lcom/android/launcher3/widget/suggest/v$h;
.super Ljava/lang/Object;
.source "SuggestWidgetUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/suggest/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "h"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:I


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/v$h;->a:Ljava/lang/String;

    .line 4
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/v$h;->b:Ljava/lang/String;

    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/suggest/v$h;->c:Ljava/lang/String;

    .line 6
    iput p4, p0, Lcom/android/launcher3/widget/suggest/v$h;->d:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/android/launcher3/widget/suggest/w;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/suggest/v$h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/v$h;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/v$h;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/suggest/v$h;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/suggest/v$h;->d:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/v$h;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
